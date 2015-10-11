{literal}
<script type="text/javascript">
/**
 * @TODO "Donate now" instead of Contribute.
 * @TODO "Join Now"
 */
(function($) {
  var alvCustom = {
    init: function() {
      window.civicrmSubmitOnce = window.submitOnce;
      window.submitOnce = function(obj, formId, procText) {
        // On contribute form submit, do a JS pre-check for empty
        // fields and simulate a failed validation without submission.
        var valid = true;
        $('input.required, input.creditcard, input#cvv2', $('form[name=' + formId + ']')).each(function(i, el) {
          if ($(this).val() == '') {
            $(this).addClass('error');
            $(this).after('<span class="crm-error">This field is required</span>');
            $(this).closest('.crm-section').find('label').addClass('crm-error');
            // Only scroll to the first element which fails
            // validation. Here valid is used to test whether we've
            // previously failed on this submission event.
            if (valid) {
              $('html, body').animate({scrollTop: $(this).offset().top - 50}, 1000);
              valid = false;
            }
          }
        });
        console.log(valid, 'valid');
        // Here valid is used to test whether the form should proceed
        // with submission.
        if (valid) {
          // This is the default CiviCRM 'submitOnce' function,
          // delivered inline.
          return civicrmSubmitOnce(obj, formId, procText);
        }
        else {
          return false;
        }       
      }
    }
  };
  
  // Bootstrap on page load.
  $('body').ready(function() {
    alvCustom.init();
  });
})(jQuery);
</script>
{/literal}

