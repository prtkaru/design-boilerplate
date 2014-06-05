{% comment %}<!-- SITE WIDE JAVASCRIPTS -->{% endcomment %}
<script src="{{ javascripts_path }}/jquery.js?23"></script>
<script src="{{ javascripts_path }}/main.js?23"></script>
<script src="{{ javascripts_path }}/backstretch.js?23"></script>
<script src="{{ javascripts_path }}/overthrow.js?23"></script>

{% comment %}<!-- SITE SEARCH INITIATION -->{% endcomment %}
{% if site.search.enabled %}
  <script src="http://static.edicy.com/assets/site_search/3.0/site_search.js?23"></script>
  <script>
    var edys_site_search_options = {
      texts: { noresults: "{{ "search_noresults" | lc }}" },
      default_stylesheet_enabled: false
    }
  </script>
{% endif %}

{% comment %}<!-- GOOGLE ANALYTICS INITIATION -->{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
