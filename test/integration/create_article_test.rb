require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest

  setup do
    @article = Article.create(title: "Title", description: "Some description")
  end

  test "Get new article form and create article " do
    get "articles/new"
    assert_response :success
    assert_difference("Article.count", 1) do
    post_via:redirect articles_path, article: { title: "Test Article", description: "Some description" } ,category_ids: [@category.id]
    end
    assert_template 'articles/show'
    assert_match "Test Article", response.body
  end

  test "Get new article form and reject invalid article submission " do
    get "articles/new"
    assert_response :success
    assert_no_difference("Article.count") do
      post categories_path, params: { article: { title: " ", description: " " } }
    end
    assert_match "errors"
  end
end
