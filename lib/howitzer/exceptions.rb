# This module holds all custom howitzer exceptions
module Howitzer
  CommunicationError = Class.new(StandardError)
  ParseError = Class.new(StandardError)
  InvalidApiKeyError = Class.new(StandardError)
  BadElementParamsError = Class.new(StandardError)
  NoValidationError = Class.new(StandardError)
  UnknownValidationError = Class.new(StandardError)
  EmailNotFoundError = Class.new(StandardError)
  NoAttachmentsError = Class.new(StandardError)
  DriverNotSpecifiedError = Class.new(StandardError)
  UnknownDriverError = Class.new(StandardError)
  CloudBrowserNotSpecifiedError = Class.new(StandardError)
  SelBrowserNotSpecifiedError = Class.new(StandardError)
  UnknownBrowserError = Class.new(StandardError)
  IncorrectPageError = Class.new(StandardError)
  AmbiguousPageMatchingError = Class.new(StandardError)
  NoMailAdapterError = Class.new(StandardError)
  NoPathForPageError = Class.new(StandardError)
  NoEmailSubjectError = Class.new(StandardError)
  NoDataError = Class.new(StandardError)
end
