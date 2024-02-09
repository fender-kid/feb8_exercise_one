# spec/models/article_spec.rb

require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validations' do
    it 'is not valid without a title' do
      article = Article.new(title: nil, content: 'a' * 50)
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'is not valid without content' do
      article = Article.new(title: 'Valid Title', content: nil)
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'is not valid with a title shorter than 5 characters' do
      article = Article.new(title: 'abcd', content: 'a' * 50)
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("is too short (minimum is 5 characters)")
    end

    it 'is not valid with content shorter than 50 characters' do
      article = Article.new(title: 'Valid Title', content: 'a' * 49)
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("is too short (minimum is 50 characters)")
    end

    it 'is valid with all conditions met' do
      article = Article.new(title: 'Valid Title', content: 'a' * 50)
      expect(article).to be_valid
    end
  end
end
