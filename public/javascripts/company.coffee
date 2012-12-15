class Company
  constructor: ->
    @bindFormSubmission()

  bindFormSubmission: ->
    self = @
    $('form').submit ->
      $.post(
        $(this).attr('action')
        $(this).serialize()
        self.processFormSubmission
      )
      return false

  processFormSubmission: (data, textStatus, xhr)->
    alert data.answer

$ ->
  window.company = new Company()
