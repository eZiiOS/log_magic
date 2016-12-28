module LogMagic::TemplatingUtils
  def rendered_template
    engine = Haml::Engine.new(File.read(template_path))
    engine.render(self)
  end

  def template_path
    File.expand_path(
      File.join(__FILE__, '..', '..', 'explainer_templates', template_name)
    )
  end

  def enriche
    @query_json.gsub!(match_regex, rendered_template)
  end
end
