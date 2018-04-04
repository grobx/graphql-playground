# frozen_string_literal: true

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema'

  field :post do
    type Types::PostType
    argument :id, !types.ID
    description 'Find a Post by ID'
    resolve lambda { |_obj, args, ctx|
      names = ctx.selection.ast_nodes[0].selections.map(&:name)
      Post.select(names).where(id: args['id']).first!
    }
  end
end
