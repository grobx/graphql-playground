# frozen_string_literal: true

Types::PostType = GraphQL::ObjectType.define do
  name 'Post'
  field :id, types.Int
  field :title, types.String
  field :rating, types.Int
  field :comments, types[Types::CommentType]
end
