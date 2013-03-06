class CustomHtmlMaker < RbbCode::HtmlMaker
	RbbCode::DEFAULT_ALLOWED_TAGS << 'synt'
    def html_from_synt_tag(node)
        if node.value.nil?
            syntaxys = 'php'
        else
            syntaxys = node.value
        end
        inner_html = node.inner_bb_code.gsub(/\[\/?br\]/, "\n")

        content_tag('pre', inner_html, {'class' => "brush: #{syntaxys}"})
    end
end