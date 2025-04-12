class FlowerListController {

  // App logic comes here
  bool toggleFlowerWaterStatus(int id, bool currentStatus) {
    DateTime today = DateTime.now();
    if (today.hour > 5) {
      return !currentStatus;
    }
    return currentStatus;
  }
}
