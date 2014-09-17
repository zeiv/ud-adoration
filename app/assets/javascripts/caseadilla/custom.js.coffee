# CASEIN CUSTOM
# Use this file for your project-specific Caseadilla JavaScript

jQuery ($) ->
  $(document).on 'ready page:load', ->
    if $('.duplicatable-nested-form').length

      nestedForm = $('.duplicatable-nested-form').last().clone()
      $('.duplicatable-nested-form').last().hide()
      $('.duplicatable-nested-form').last().children().attr("disabled", "disabled")

      # $(".destroy-duplicate-nested-form:first").remove()

      $('body').on 'click', '.destroy-duplicate-nested-form', (e) ->
        $(this).closest('.duplicatable-nested-form').slideUp().remove()

      $('.add-nested-form-item').click (e) ->
        e.preventDefault()

        lastNestedForm = $('.duplicatable-nested-form').last()
        newNestedForm  = $(nestedForm).clone()
        formsOnPage    = $('.duplicatable-nested-form').length

        $(newNestedForm).find('label').each ->
          oldLabel = $(this).attr 'for'
          newLabel = oldLabel.replace(new RegExp(/_[0-9]+_/), "_#{formsOnPage}_")
          $(this).attr 'for', newLabel

        $(newNestedForm).find('select, input').each ->
          oldId = $(this).attr 'id'
          newId = oldId.replace(new RegExp(/_[0-9]+_/), "_#{formsOnPage}_")
          $(this).attr 'id', newId

          oldName = $(this).attr 'name'
          newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[#{formsOnPage}]")
          $(this).attr 'name', newName

        $( newNestedForm ).insertAfter( lastNestedForm ).removeAttr("disabled")