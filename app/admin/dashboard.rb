ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
        para "Please use the menu above to control the site."
        para "On the main site, enter the following as a username/password combo to view the site as superuser."
        para "E-Mail: administrator@showcase.com Password: 2CIfbGhc3h"
        para "Your administration account used here, in the Admin interface, will not work on the main site. That is why I have this specialty account set up."
        link_to "View Site", "/"
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  #end # content
end
