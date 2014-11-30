$(function() {
  $('#next_expl').click(function() {
    if ($("input[type='radio']:checked").length == 0) {
        alert('Please select a candidate before submitting.');
        return false;
    }
  })
});
