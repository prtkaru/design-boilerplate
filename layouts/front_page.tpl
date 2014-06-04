<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% endif %}

  {% include "bg-picker-variables" %}

  {{ site.stats_header }}
</head>

<body class="front-page">
  {% if editmode %}<button class="bgpicker-btn js-bgpicker-body-settings" data-bg-image="{{ body_image }}" data-bg-color="{{ body_color }}"></button>{% endif %}
  {% unless editmode %}
    {% unless body_color == nil or body_color == '' %}<div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>{% endunless %}
  {% else %}
    <div class="background-color js-bgpicker-body-color"{{ body_color_style }}></div>
  {% endunless %}

  <div class="container">
    {% include "header" %}
    {% include "menu-level-2" %}

    <main class="content" role="main">
      <header class="content-header">
        {% if editmode or site.header.size > 0 %}<div class="content-title content-formatted">{% editable site.header %}</div>{% endif %}

        {% capture content_slogan_html %}{% unless editmode %}{% content name="slogan" %}{% endunless %}{% endcapture %}
        <div class="content-slogan content-formatted js-content-optional">{% content name="slogan" %}</div>
      </header>

      <section class="content-body content-formatted">{% content %}</section>
    </main>

    {% include "footer" %}

  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
  <script>
    {% unless body_image == nil or body_image == '' %}
      $.backstretch('{{ body_image }}');
    {% endunless %}

    site.initFrontPage();
  </script>
</body>
</html>
