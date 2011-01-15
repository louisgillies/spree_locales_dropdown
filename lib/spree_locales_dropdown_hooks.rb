class SpreeLocalesDropdownHooks < Spree::ThemeSupport::HookListener
    insert_after :inside_head do
    %(
      <link type="text/css" rel="stylesheet" media="screen" href="/stylesheets/dd.css"/>
      <%= javascript_include_tag 'jquery.dd.js' %>
    )
  end
end