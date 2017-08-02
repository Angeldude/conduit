defmodule Conduit.Blog.Commands.CommentOnArticle do
  defstruct [
    uuid: "",
    body: "",
    article_uuid: "",
    author_uuid: "",
  ]

  use ExConstructor
  use Vex.Struct

  alias Conduit.Accounts.User
  alias Conduit.Blog.Article
  alias Conduit.Blog.Commands.CommentOnArticle

  validates :uuid, uuid: true
  validates :body, presence: [message: "can't be empty"], string: true
  validates :article_uuid, uuid: true
  validates :author_uuid, uuid: true

  def assign_uuid(%CommentOnArticle{} = comment, uuid) do
    %CommentOnArticle{comment |
      uuid: uuid,
    }
  end

  def assign_article(%CommentOnArticle{} = comment, %Article{uuid: article_uuid}) do
    %CommentOnArticle{comment |
      article_uuid: article_uuid,
    }
  end

  def assign_author(%CommentOnArticle{} = comment, %User{uuid: author_uuid}) do
    %CommentOnArticle{comment |
      author_uuid: author_uuid,
    }
  end
end
