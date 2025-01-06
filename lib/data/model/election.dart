enum Election { DE, EU }

extension ElectionLocalization on Election {
  String get localized {
    switch (this) {
      case Election.DE:
        return 'German Election';
      case Election.EU:
        return 'EU Election';
    }
  }
}

extension ElectionImages on Election {
  String get pigeon {
    switch (this) {
      case Election.DE:
        return 'assets/images/img_pigeon.svg';
      case Election.EU:
        return 'assets/images/img_pigeon.svg';
    }
  }

  String get swipe {
    switch (this) {
      case Election.DE:
        return 'assets/images/img_swipe.svg';
      case Election.EU:
        return 'assets/images/img_swipe.svg';
    }
  }

  String get results {
    switch (this) {
      case Election.DE:
        return 'assets/images/img_results.svg';
      case Election.EU:
        return 'assets/images/img_results.svg';
    }
  }
}

extension BackendElection on Election {
  String get backend {
    switch (this) {
      case Election.DE:
        return 'de';
      case Election.EU:
        return 'eu';
    }
  }
}
