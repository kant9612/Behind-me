class SearchController < ApplicationController
  before_action :authenticate_user!

	def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    # @how = params["search"]["how"]
    @datas = search_for(@model, @content)
  end

  private

  # def match(model, content)
  #   if model == 'user'
  #     User.where(name: content)
  #   elsif model == 'list'
  #     List.joins(:list_categories).where('list_categories.category_id = ?', content)
  #   end
  # end
  def partical(model, content)
    if model == 'user'
      User.where("name LIKE ?", "%#{content}%")
    elsif model == 'list'
      List.where("list_title LIKE ?", "%#{content}%")
      # List.joins(:list_categories).where('list_categories.category_id = ?', content)
    end
  end
  def search_for(model, content)
  #   case how
  #   # when 'match'
  #   #   match(model, content)
  #   when 'partical'
  #     partical(model, content)
  #   end
  end
end
