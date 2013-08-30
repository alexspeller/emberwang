class WangSerializer < ActiveModel::Serializer
  attributes :token, :name, :description, :javascript, :style, :libraries, :templates, :email, :script_language
end
