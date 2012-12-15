class Form
  constructor: ->
    @bindSubmission()

  bindSubmission: ->
    self = @
    $('form').submit ->
      $.post(
        $(this).attr('action')
        $(this).serialize()
        self.processSubmission
      )
      return false

  processSubmission: (data, textStatus, xhr)->
    alert data.answer

$ ->
  window.form = new Form()
