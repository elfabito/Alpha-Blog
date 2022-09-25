class ArticleCategory < ApplicationRecord

  belong_to :article
  belong_to :category

end
