class WangSerializer < ActiveModel::Serializer
  attributes :token, :name, :description, :javascript, :style, :libraries, :templates
end
