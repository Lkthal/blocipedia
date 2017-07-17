module ApplicationHelper

    def markdown(text)
        options = {
            filter_html:    true,
            hard_wrap:      true,
            link_attributes: { rel: 'nofollow', target: '_blank' }            
        }

        extensions = {
            autolink:               true,
            underline:              true,
            strikethrough:          true,
            tables:                 true,
            superscript:            true,
            space_after_headers:    true,
            fenced_code_blocks:     true,
            disable_indented_code_blocks: true
        }

        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions)

        markdown.render(text).html_safe
    end
end
