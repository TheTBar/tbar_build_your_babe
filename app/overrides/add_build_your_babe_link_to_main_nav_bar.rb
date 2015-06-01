Deface::Override.new(:virtual_path => 'spree/shared/_main_nav_bar',
                     :name => 'add_build_your_babe_link_to_main_nav',
                     :insert_after => "li#home-link",
                     :text => "<li id=\"build-your-babe-link\" data-hook><%= link_to Spree.t('build your babe'), build_your_babe_path %></li>")