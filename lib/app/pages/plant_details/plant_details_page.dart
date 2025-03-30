import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/buttons/planta_outlined_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/models/device_model.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/routes/app_router.dart';
import 'package:planta_care/app/services/plant_sub_location_service.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/device_collection.dart';
import 'package:planta_care/firebase/location_collection.dart';
import 'package:planta_care/firebase/plant_collection.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlantDetailsPage extends StatefulWidget {
  const PlantDetailsPage({
    this.onNext,
    this.onGoBack,
    this.plantId,
    this.plant,
    super.key,
  });

  final void Function()? onNext;
  final void Function()? onGoBack;
  final String? plantId;
  final MyPlantModel? plant;

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  MyPlantModel? _plant;
  DeviceModel? _device;
  PlantSubLocationModel? _location;
  StreamSubscription? _deviceSubscription;
  bool _isLoading = false;

  MyPlantModel? get plant => widget.plant ?? _plant;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getData();
    });
  }

  Future<void> _getData() async {
    setState(() {
      _isLoading = true;
    });
    if (widget.plantId != null) {
      await _getPlant();
      _setupDeviceListener();
    }
    _getLocation();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _deviceSubscription?.cancel();
    super.dispose();
  }

  Future<void> _getPlant() async {
    final plant = await PlantCollection.getPlantById(
        widget.plantId, Auth.currentUser?.email);
    setState(() {
      _plant = plant;
    });
  }

  Future<void> _setupDeviceListener() async {
    if (plant?.deviceId == null || plant?.deviceId == '') {
      return;
    }
    await _enableRealTime();

    _deviceSubscription =
        DeviceCollection.listenToDevice(plant?.deviceId ?? '').listen((device) {
      if (device != null && mounted) {
        setState(() {
          _device = device;
        });
      }
    });
  }

  Future<void> _getLocation() async {
    final location = await LocationCollection.getLocationById(
      Auth.currentUser?.email,
      plant?.locationId ?? '',
    );
    setState(() {
      _location = location;
    });
  }

  Future<void> _enableRealTime() async {
    await DeviceCollection.setRealTimeEnabled(
      plant?.deviceId ?? '',
      true,
    );
  }

  String _formatTimestamp(DateTime? timestamp) {
    if (timestamp == null) {
      return '';
    }
    return DateFormat('MM/dd/yyyy HH:mm:ss').format(timestamp);
  }

  Widget _buildData(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Skeleton.keep(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                ),
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }

  Widget _buildCare({
    Widget? icon,
    String? title,
    void Function()? onTap,
  }) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        minVerticalPadding: 0,
        minTileHeight: 0,
        minLeadingWidth: 0,
        onTap: onTap,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        tileColor: Theme.of(context).colorScheme.surface,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            const SizedBox(height: 4.0),
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final location = _location;
    return PrimaryScrollController(
      controller: ScrollControllers.getController('/home/plant-details'),
      child: Skeletonizer(
        enabled: _isLoading,
        child: PlantScaffold(
          appBar: PlantAppBar(
            leading: Skeleton.keep(
              child: PlantaAppBarButton(
                context: context,
                onPressed: widget.onGoBack ?? () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            trailing: Skeleton.keep(
              child: PlantaAppBarButton(
                context: context,
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
          ),
          overlayItem: _isLoading
              ? const SizedBox()
              : Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.only(
                    right: 20.0,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32.0,
                        ),
                        child: Skeleton.keep(
                          child: Image.asset(
                            'assets/images/where_are_your_plants.png',
                            height: MediaQuery.sizeOf(context).height * 0.26,
                          ),
                        ),
                      ),
                      if (plant?.deviceId != null &&
                          plant?.deviceId != '' &&
                          !_isLoading)
                        Expanded(
                          child: Skeletonizer(
                            enabled: _device == null,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _buildData('Light', 'Difuse'),
                                        const SizedBox(height: 8.0),
                                        _buildData('Humidity',
                                            '${_device?.humidity}%'),
                                      ],
                                    ),
                                    const SizedBox(width: 12.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _buildData('Temperature',
                                            '${_device?.temperature}°C'),
                                        const SizedBox(height: 8.0),
                                        _buildData('Moisture',
                                            '${_device?.moisture}%'),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Skeleton.keep(
                                  child: Text(
                                    'Last Update:',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withAlpha(120),
                                        ),
                                  ),
                                ),
                                Text(
                                  _formatTimestamp(_device?.timestamp),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withAlpha(120),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 20.0),
                            Text(
                              'Monitor your plant',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withAlpha(120),
                                  ),
                            ),
                            const SizedBox(height: 12.0),
                            PlantaOutlinedButton(
                              context: context,
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.add),
                                    SizedBox(width: 4.0),
                                    Text('Add a device'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
          bottomSheet: widget.onNext == null
              ? null
              : SizedBox(
                  width: double.infinity,
                  child: PlantaFilledButton(
                    context: context,
                    onPressed: () => widget.onNext?.call(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Add Plant',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                      ),
                    ),
                  ),
                ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              Text(
                plant?.name ?? 'Plant Name',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12.0),
              Text(
                'Has been used for medical purposes for more than 2.000 years, treahng various ailments. Ancient ovilizations reled on its healing properties for pain relaf and wellness',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withAlpha(120),
                    ),
              ),
              const SizedBox(height: 16.0),
              Skeleton.keep(
                child: Text(
                  'Plant Care',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                spacing: 16.0,
                children: [
                  Expanded(
                    child: _buildCare(
                      icon: SvgPicture.asset(
                        'assets/svg/icons/my_place.svg',
                        width: 20.0,
                        height: 20.0,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: 'Easy',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: _buildCare(
                      icon: const Icon(
                        Icons.water_drop,
                        color: Colors.blue,
                      ),
                      title: 'Low',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: _buildCare(
                      icon: const Icon(
                        Icons.sunny,
                        color: Colors.orange,
                      ),
                      title: 'Medium',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: _buildCare(
                      icon: const Icon(
                        Icons.warning_rounded,
                        color: Colors.red,
                      ),
                      title: 'Toxic',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Skeleton.keep(
                child: Text(
                  'Location',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 8.0),
              if (location != null)
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  tileColor: Theme.of(context).colorScheme.surface,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8.0),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: PlantSubLocationService
                                      .getIconColorByPlantLocationModel(
                                          location)
                                  ?.withAlpha(40) ??
                              Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(20),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Icon(
                          PlantSubLocationService.getIconByPlantLocationModel(
                                  location) ??
                              Icons.dashboard_customize,
                          color: PlantSubLocationService
                                  .getIconColorByPlantLocationModel(location) ??
                              Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(120),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        location.name ?? 'Location',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        location.description ?? '',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(120),
                            ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
