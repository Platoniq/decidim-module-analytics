// Auto-refresh iframe every 30 minutes
document.addEventListener('DOMContentLoaded', function() {
  const iframe = document.querySelector('#analytics iframe');

  if (iframe) {
    setInterval(function() {
      // eslint-disable-next-line no-self-assign
      iframe.src = iframe.src;
    }, 1800000); // 30 minutes
  }
});
