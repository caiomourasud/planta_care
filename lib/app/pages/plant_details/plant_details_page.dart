import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/buttons/planta_outlined_button.dart';
import 'package:planta_care/app/components/plants_list.dart/my_plants_horizontal_list.dart';
import 'package:planta_care/app/enums/popular_plant.dart';
import 'package:planta_care/app/models/device_model.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/pages/initial/popular_plants_page/square_popular_plant_card.dart';
import 'package:planta_care/app/pages/plant_details/components/activity_end_drawer_content.dart';
import 'package:planta_care/app/pages/plant_details/components/irrigation_card.dart';
import 'package:planta_care/app/pages/plant_details/components/location_section.dart';
import 'package:planta_care/app/pages/plant_details/components/plant_care_section.dart';
import 'package:planta_care/app/pages/plant_details/components/sliver_plant_name_delegate.dart';
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
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final _controller = DraggableScrollableController();
  MyPlantModel? _plant;
  DeviceModel? _device;
  PlantSubLocationModel? _location;
  StreamSubscription? _deviceSubscription;

  bool _isLoading = false;
  Timer? _timer;
  double _imageHeight = 210;
  double _titlePadding = 0.0;
  double _titlePaddingTop = kToolbarHeight;

  double draggableDrawerSize = 0.0;

  double get appBarHeight =>
      kToolbarHeight + MediaQuery.of(context).viewPadding.top;

  double get screenHeightWithoutAppBar =>
      MediaQuery.of(context).size.height - appBarHeight;

  double pixelsToSizeFullScreen(double pixels) {
    return pixels / screenHeightWithoutAppBar;
  }

  double get minChildSize =>
      pixelsToSizeFullScreen(screenHeightWithoutAppBar - 250);

  double get maxChildSize =>
      pixelsToSizeFullScreen(screenHeightWithoutAppBar - (appBarHeight - 16.0));

  double get renderBorderRadious =>
      draggableDrawerSize > (maxChildSize - pixelsToSizeFullScreen(7.5))
          ? (maxChildSize - draggableDrawerSize) * 2000 / maxChildSize
          : 20;

  MyPlantModel? get plant => widget.plant ?? _plant;

  String get _imagePath =>
      plant?.localUrl ??
      plant?.category?.localUrl ??
      'assets/images/where_are_your_plants.png';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (mounted) {
        setState(() {
          draggableDrawerSize =
              _controller.pixels / MediaQuery.of(context).size.height;
          double minScrollExtent =
              minChildSize * MediaQuery.of(context).size.height;
          double maxScrollExtent =
              maxChildSize * MediaQuery.of(context).size.height;

          if (_controller.pixels < minScrollExtent) {
            _imageHeight = kToolbarHeight;
          } else if (_controller.pixels > maxScrollExtent) {
            _imageHeight = kToolbarHeight;
          } else {
            double scrollRange = maxScrollExtent - minScrollExtent;
            double imageHeightRange = 210 - kToolbarHeight;
            double scrollPosition = _controller.pixels - minScrollExtent;
            _imageHeight =
                210 - (scrollPosition / scrollRange) * imageHeightRange;
          }
          double scrollRange = maxScrollExtent - minScrollExtent;

          if (_controller.pixels <= minScrollExtent) {
            _titlePadding = 0.0;
          } else if (_controller.pixels >= maxScrollExtent) {
            _titlePadding = 82.0;
          } else {
            double scrollPosition = _controller.pixels - minScrollExtent;
            _titlePadding = (scrollPosition / scrollRange) * 82.0;
          }
          _titlePaddingTop = kToolbarHeight -
              ((_controller.pixels - minScrollExtent) / scrollRange) *
                  kToolbarHeight;
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getData();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(() {});
    _deviceSubscription?.cancel();
    _timer?.cancel();
    super.dispose();
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
    _timer = Timer.periodic(const Duration(milliseconds: 2200), (timer) async {
      await DeviceCollection.setRealTimeEnabled(
        plant?.deviceId ?? '',
        true,
      );
    });
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

  @override
  Widget build(BuildContext context) {
    final location = _location;
    return Scaffold(
      key: _key,
      endDrawer: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.94,
        ),
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top,
        ),
        color: Theme.of(context).colorScheme.surface,
        child: ActivityEndDrawerContent(
          plantId: widget.plantId,
          onClose: () {
            _key.currentState?.closeEndDrawer();
          },
        ),
      ),
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(
                    (draggableDrawerSize >= (maxChildSize - 0.001) ? 255 : 0),
                  ),
              elevation: 0,
              automaticallyImplyLeading: false,
              leadingWidth: 80,
              leading: Skeleton.keep(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Center(
                    child: PlantaAppBarButton(
                      context: context,
                      onPressed: widget.onGoBack ??
                          () {
                            context.pop();
                          },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ),
              actions: [
                widget.onNext == null &&
                        plant?.deviceId != null &&
                        plant?.deviceId != '' &&
                        !_isLoading
                    ? Skeleton.keep(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Center(
                            child: PlantaAppBarButton(
                              context: context,
                              onPressed: () {
                                context.push(
                                    '/plant-details/${plant?.id}/charts/${plant?.id}');
                              },
                              icon: Icon(
                                Icons.bar_chart_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                if (plant?.deviceId == null ||
                    plant?.deviceId == '' && _imageHeight < 180)
                  Skeleton.keep(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Center(
                        child: Tooltip(
                          message: 'Add a device',
                          child: PlantaAppBarButton(
                            context: context,
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            controller: _controller,
            initialChildSize: minChildSize,
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            builder: (context, scrollController) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(renderBorderRadious),
                    topRight: Radius.circular(renderBorderRadious),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverToBoxAdapter(
                            child: Container(
                              color: Theme.of(context).colorScheme.surface,
                              height: 40.0,
                            ),
                          ),
                          SliverPersistentHeader(
                            pinned: true,
                            floating: true,
                            delegate: SliverPlantNameDelegate(
                              child: Container(
                                color: Theme.of(context).colorScheme.surface,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            plant?.name ?? 'Plant Name',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        const SizedBox(width: 12.0),
                                        IconButton(
                                          onPressed: () {
                                            _key.currentState?.openEndDrawer();
                                          },
                                          icon: const Icon(
                                              Icons.edit_note_rounded),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const SizedBox(height: 8.0),
                                        Text(
                                          plant?.description == null ||
                                                  plant?.description?.isEmpty ==
                                                      true
                                              ? 'No description'
                                              : plant?.description ?? '',
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
                                        const SizedBox(height: 20.0),
                                        PlantCareSection(
                                          myPlant: plant,
                                        ),
                                        const SizedBox(height: 20.0),
                                        IrrigationCard(
                                          plantId: plant?.id,
                                        ),
                                        const SizedBox(height: 20.0),
                                        LocationSection(location: location),
                                        const SizedBox(height: 20.0),
                                        Skeleton.keep(
                                          child: Text(
                                            'Category',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
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
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface
                                                    .withAlpha(20),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            tileColor: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                            title: Row(
                                              children: [
                                                Icon(
                                                  plant?.category?.icon ??
                                                      Icons.dashboard_customize,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                                const SizedBox(width: 16.0),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      plant?.category?.title ??
                                                          'Category',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium
                                                          ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    const SizedBox(height: 4.0),
                                                    Text(
                                                      plant?.category
                                                              ?.description ??
                                                          '',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onSurface
                                                                .withAlpha(120),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                      ]),
                                ),
                                const SizedBox(height: 16.0),
                                widget.onNext == null
                                    ? MyPlantsHorizontalList<PopularPlant>(
                                        title: 'Popular Plants',
                                        aspectRatioItem: 7 / 5.7,
                                        items: PopularPlant.values.toList(),
                                        itemBuilder: (item, height) {
                                          return SquarePopularPlantCard(
                                            key: Key(item.id),
                                            plant: item,
                                            onTap: () {
                                              context.push(
                                                  '/add-plant?popularPlantId=${item.id}');
                                            },
                                          );
                                        },
                                      )
                                    : Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                        ),
                                        width: double.infinity,
                                        child: PlantaFilledButton(
                                          context: context,
                                          onPressed: () =>
                                              widget.onNext?.call(),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 12.0,
                                            ),
                                            child: Text(
                                              'Add Plant',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .surface,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                SizedBox(
                                  height: MediaQuery.paddingOf(context).bottom +
                                      12.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          AnimatedContainer(
            margin: EdgeInsets.only(
              left: _titlePadding,
              top: MediaQuery.paddingOf(context).top + _titlePaddingTop,
            ),
            alignment: Alignment.centerLeft,
            duration: const Duration(milliseconds: 30),
            curve: Curves.easeOut,
            height: _imageHeight,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 20 / 21,
                  child: _isLoading
                      ? const SizedBox()
                      : Image.asset(
                          _imagePath,
                          fit: BoxFit.contain,
                        ),
                ),
                SizedBox(width: _titlePadding / 6),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: _imageHeight >= 150 ? 22.0 : 12.0),
                    child: Column(
                      children: [
                        if (plant?.deviceId != null &&
                            plant?.deviceId != '' &&
                            !_isLoading)
                          Expanded(
                            child: IgnorePointer(
                              ignoring: true,
                              child: Skeletonizer(
                                enabled: _device == null,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 50.0,
                                                ),
                                                child: _buildData('Light',
                                                    _device?.lightLevel ?? ''),
                                              ),
                                              if (_imageHeight >= 150) ...[
                                                const SizedBox(height: 8.0),
                                                _buildData('Temperature',
                                                    '${_device?.temperature}°C'),
                                              ]
                                            ],
                                          ),
                                          SizedBox(width: _imageHeight / 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              _buildData('Moisture',
                                                  '${_device?.moisturePercentage ?? 0.0}%'),
                                              if (_imageHeight >= 150) ...[
                                                const SizedBox(height: 8.0),
                                                _buildData('Humidity',
                                                    '${_device?.humidity}%'),
                                              ],
                                            ],
                                          ),
                                        ],
                                      ),
                                      if (_imageHeight >= 200) ...[
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        else if (_imageHeight >= 180)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 20.0),
                                Text(
                                  'Monitor your plant',
                                  textAlign: TextAlign.center,
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
                                Center(
                                  child: PlantaOutlinedButton(
                                    context: context,
                                    onPressed: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add),
                                          SizedBox(width: 4.0),
                                          Text('Add a device'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
