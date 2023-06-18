class Importmap::Scope
  def initialize(map, scope)
    @map = map
    @scope = scope
  end

  def pin(name, to: nil, preload: false)
    @map.scoped_packages[@scope][name] = MappedFile.new(name: name, path: to || "#{name}.js", preload: preload)
  end

  # possibly allow for pin_all_from inside a scope
  # then will also need a "expanded_scoped_directories_and_packages" kinda method in Map

  private

  MappedFile = Struct.new(:name, :path, :preload, keyword_init: true)
end
