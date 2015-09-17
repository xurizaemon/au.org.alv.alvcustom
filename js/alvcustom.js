/**
 * @TODO "Donate now" instead of Contribute.
 * @TODO "Join Now"
 */
(function($) {
  var alvCustom = {
    init: function() {
      $('form#Main.CRM_Contribute_Form_Contribution_Main').on('submit', function(ev) {
        // On contribute form submit, do a JS pre-check for empty
        // fields and simulate a failed validation without submission.
        var firstEl = true;
        $('input.required, input.creditcard, input.cvv2', this).each(function(i, el) {
          if ($(this).val() == '') {
            $(this).addClass('error');
            // $(this).css({backgroundColor: '#fcc'});
            // $(this).css({border: '4px solid red'});
            $(this).after('<span class="crm-error">This field is required</span>');
            $(this).closest('.crm-section').find('label').addClass('crm-error');
            if (firstEl) {
              $('html, body').animate({scrollTop: $(this).offset().top - 50}, 1000);
              ev.preventDefault();
              firstEl = false;
            }
          }
        });
      });      
    }
  };
  
  // Bootstrap on page load.
  $('body').ready(function() {
    alvCustom.init();
  });
})(jQuery);


