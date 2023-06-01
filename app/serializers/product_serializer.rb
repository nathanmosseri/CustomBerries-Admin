class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :box_count
end
