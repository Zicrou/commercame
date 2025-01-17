class VentesController < ApplicationController
  before_action :set_vente, only: %i[ show edit update destroy ]

  # GET /ventes or /ventes.json
  def index
    @vents = Vente.where("quantity > ?", 0)

    @ventes = @vents.group_by{|m| m.created_at.beginning_of_month }
    @total_per_year = @vents.group_by { |y| y.created_at.beginning_of_year }.transform_values { |v| v.sum(&:price) }
    #@total = @vents.sum(&:price)

    @reparations = Reparation.all
    @rep_per_month = @reparations.group_by{|m| m.created_at.beginning_of_month }.transform_values { |v| v.sum(&:price) }

    puts "Reparations per month: #{@rep_per_month}"
    @rep_per_year = @reparations.group_by { |y| y.created_at.beginning_of_year }.transform_values { |v| v.sum(&:price) }
    puts "Reparations per year:"    
    puts "Reparations per year: avec each loop"    
    @rep_per_year.each do |year, price|
      puts "#{year.strftime('%B %Y')}:  ,Price: #{price} FCFA"
      
    end
    #@reparations_and_vent_prices = 0 

    # @rep_per_month = @reparations.group_by{|m| m.created_at.beginning_of_month }.transform_values { |v| v.sum(&:price) }
    @rep_per_year = @reparations.group_by { |y| y.created_at.beginning_of_year }.transform_values { |v| v.sum(&:price) }
    puts "Reparations per year: #{@rep_per_month}"
    @rep_per_year.each do |year, price|
      puts "#{year.strftime('%B %Y')}:  ,Price: #{price} FCFA"
    end

    
    # @rep_per_week = @reparations.group_by{|m| m.created_at.beginning_of_week }.transform_values { |v| v.sum(&:price) }
    
    #Recuperer les reparations qui  ont eu lieu dans le mois et l'année en se basant sur @vnets(donc avec un loop )
    # @reparations_and_vent_prices= 0
    # @vents.each do |vent|
    #   reparations_and_vent = @reparations.select do |reparation| 
    #     reparation.created_at.year == vent.created_at.year && reparation.created_at.month == vent.created_at.month
    #     #@reparations_and_vent_prices = reparations_and_vent.sum(&:price) + vent.sum(&:price)
    #   end
    #   puts "Reparations for vente in #{vent.created_at.strftime('%B %Y')}:"
    #   reparations_and_vent.each do |reparation|
    #   puts "Reparation ID: #{reparation.id}, Price: #{reparation.price}, Date: #{reparation.created_at.month}, #{reparation.created_at.year}"
    #   #@reparations_and_vent_prices = reparations_and_vent.sum(&:price)
    #   # puts "Total: #{@reparations_and_vent_prices}"
    #   end
    # end



    #
    #@vents = Vente.where(user_id: current_user.id)
    
    
    # Afficher les ventes par semaines
    #@ventes_per_week = @vents.group_by{|m| m.created_at.beginning_of_week }


    # Afficher les ventes par mois
    #@ventes = @vents.group_by{|m| m.created_at.beginning_of_month }
    # # Afficher les ventes par semaines
     #@ventes_per_week = @vents.group_by{|m| m.created_at.beginning_of_week }
  end

  # GET /ventes/1 or /ventes/1.json
  def show
  end

  # GET /ventes/new
  def new
    @vente = Vente.new
    @produits = Produit.all
  end

  # GET /ventes/1/edit
  def edit
  end

  # POST /ventes or /ventes.json
  def create
    @vente = Vente.new(vente_params)
    @produit = Produit.find(vente_params[:produit_id])
    if @produit.quantity < vente_params[:quantity].to_i
      redirect_to new_vente_path(), notice: "Pas assez de produit dans le de stock."
    else
      respond_to do |format|
        if @vente.save
          #@produit = Produit.find(vente_params[:produit_id])
          @produit.quantity -= vente_params[:quantity].to_i
          @produit.save 
          format.html { redirect_to @vente, notice: "Vente was successfully created." }
          format.json { render :show, status: :created, location: @vente }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @vente.errors, status: :unprocessable_entity }
        end
      end
    end
    
  end

  # PATCH/PUT /ventes/1 or /ventes/1.json
  def update
    @produit = Produit.find(vente_params[:produit_id])
    @quantity_from_params = vente_params[:quantity].to_i
    if @quantity_from_params > @vente.quantity
      @produit.quantity = @produit.quantity - (@quantity_from_params - @vente.quantity)
    elsif @quantity_from_params < @vente.quantity
      @produit.quantity = @produit.quantity + (@vente.quantity - @quantity_from_params)
    end
    @produit.save
    respond_to do |format|
      
      if @vente.update(vente_params) 
        format.html { redirect_to @vente, notice: "Vente was successfully updated." }
        format.json { render :show, status: :ok, location: @vente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vente.errors, status: :unprocessable_entity }
      end
    end      
  end

  # DELETE /ventes/1 or /ventes/1.json
  def destroy
    @vente.destroy!

    respond_to do |format|
      format.html { redirect_to ventes_path, status: :see_other, notice: "Vente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vente
      @vente = Vente.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def vente_params
      params.expect(vente: [ :quantity, :price, :produit_id ])
    end
end
