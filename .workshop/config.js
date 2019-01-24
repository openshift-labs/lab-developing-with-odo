var google_analytics = `
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-2220480-5"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-2220480-5');
</script>
`

config = {
    site_title: 'Introduction to odo',
    analytics: google_analytics,

    variables: [
      {
        name: 'name',
        content: 'value'
      }
    ]
};

module.exports = config;
