RailsAdmin.config do |config|

  ### Popular gems integration
  config.main_app_name = ["Representantes Comerciais"," -[myShop]-"]

  config.navigation_static_links = {
    'OneBitCode' => 'https://onebitcode.com',
    'Phoenyx Tecnologia' => 'https://www.phoenyx.com.br',
    'ContinuosService' => 'https://www.continuosservice.com.br'
  }
  config.navigation_static_label = "Links Úteis"

  config.model Sale do
    navigation_icon 'fa fa-money'
  end

  config.model Discount do
    navigation_icon 'fa fa-badge-dollar'
  end

  config.model Comission do
    navigation_icon 'fa fa-hand-holding-usd'
  end

  config.model ProductQuantity do
    visible false
  end

  config.model Address do
    visible false
  end

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Address do
    create do
      field  :street
      field  :number
      field  :neighborhood
      field  :city
      field  :state
      field  :country
      field  :Client_id

      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end

    edit do
      field  :street
      field  :number
      field  :neighborhood
      field  :city
      field  :state
      field  :country
      field  :client_id

      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end

  config.model User do
    navigation_label 'Administração'

    navigation_icon 'fa fa-users-cog'

    create do
      field  :name
      field  :document
      field  :kind
      field  :status
      field  :notes
      field  :email
      field  :password
    end

    edit do
      field  :name
      field  :document
      field  :kind
      field  :status
      field  :notes
      field  :email
      field  :password
    end

    list do
      field  :id
      field  :name
      field  :kind
      field  :status
      field  :email
    end
  end

  config.model Sale do
    create do
      field  :client
      field  :sale_date
      field  :discount
      field  :notes
      field  :product_quantities

      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end

    edit do
      field  :client
      field  :sale_date
      field  :discount
      field  :notes
      field  :product_quantities

      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end

  config.model Client do
    navigation_icon 'fa fa-male'

    create do
      field  :name
      field  :company_name
      field  :document
      field  :email
      field  :phone
      field  :notes
      field  :status
      field  :address

      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end

    edit do
      field  :name
      field  :company_name
      field  :document
      field  :email
      field  :phone
      field  :notes
      field  :status
      field  :address

      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end

    list do
      field  :name
      field  :company_name
      field  :document
      field  :email
      field  :phone
      field  :status
    end
  end

  config.model ProductQuantity do
    visible false
  end

  config.model Address do
    visible false
  end

  config.model Product do
    navigation_icon 'fa fa-gift'
    edit do
      field  :name
      field  :description
      field  :status
      field  :price
      field  :photo
    end

    create do
      field  :name
      field  :description
      field  :status
      field  :price
      field  :photo
    end

    list do
      field  :name
      field  :description
      field  :price
      field  :status
    end
  end

  config.model ProductQuantity do
    edit do
      field :product
      field :quantity

      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end
end
