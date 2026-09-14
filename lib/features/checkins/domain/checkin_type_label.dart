/// Display label for a `CheckIn.type` value. Handles both the current enum
/// (`CHECK_IN`/`CHECK_OUT`/`VISIT`/`MEETING`) and older mobile-submitted
/// values (`visit`/`meeting`/`call`/`other`, pre-dating the switch to match
/// Dad-frontend's enum) so already-synced check-ins still render sensibly.
String checkInTypeLabel(String type) {
  switch (type.toUpperCase()) {
    case 'CHECK_IN':
      return 'Check In';
    case 'CHECK_OUT':
      return 'Check Out';
    case 'VISIT':
      return 'Visit';
    case 'MEETING':
      return 'Meeting';
    case 'CALL':
      return 'Call';
    case 'OTHER':
      return 'Other';
    default:
      return type;
  }
}
