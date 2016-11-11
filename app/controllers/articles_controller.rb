class ArticlesController <ApplicationController
	#se accede con GET/articles
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_article, except: [:new,:index, :create]
	def index
		#traer lista de todos los ariculos --active record
	 	@articles = Article.all
	end

	#get /articles/:id
	def show
		@article.update_visits_count	
		
	end

	#get 7articles/new
	def new 
		@article = Article.new
	end

	def edit
		
	end

	#post 
	def create
		@article = current_user.articles.new(article_params)

		if @article.save
				redirect_to @article
		else	
				render :new
		end
		
	end
	#cuando no esta creado lo manda a PUT /articles/:Id
	def destroy
		 #elimina el objeto d ela base de datos
		@article.destroy
		redirect_to articles_path
		
	end
		#put
	def update

		if @article.update(article_params)	
			redirect_to @article
		else
			render :edit	
		end
	end

end


private
	def set_article
		@article = Article.find(params[:id])
	end
	def validate_user
		redirect_to new_user_session_path, notice: "Necesitas iniciar sesiòn"
		
	end
	def  article_params	
		params.require(:article).permit(:title,:body)
		
	end
	