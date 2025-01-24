enum StatementResponse {
  stronglyDisagree, // -1
  disagree, // -0.5
  neutral, // 0
  agree, // 0.5
  stronglyAgree, // 1
}

extension StatementResponseBackend on StatementResponse {
  num get backend {
    return this.weight;
  }
}

extension StatementResponseWeight on StatementResponse {
  num get weight {
    switch (this) {
      case StatementResponse.stronglyDisagree:
        return -1;
      case StatementResponse.disagree:
        return -0.5;
      case StatementResponse.neutral:
        return 0;
      case StatementResponse.agree:
        return 0.5;
      case StatementResponse.stronglyAgree:
        return 1;
    }
  }
}
