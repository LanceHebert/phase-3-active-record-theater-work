class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.all.map{|a| a.actor}
  end

  def locations
    auditions.all.map{|a| a.location}
  end

  def lead
    # auditions.where(hired:true) ? auditions.where(hired:true).first : 
    #     "No actor has been hired for this role"
    auditions.find_by(hired:true) || "No actor has been hired for this role"
    
  end

  def understudy
    # if auditions.where(hired:true)
    #     auditions.where(hired:true).second
    # else
    #     "no actor has been hired for understudy for this role"
    # end
    auditions.where(hired:true).second || "no actor has been hired for understudy for this role"
  end
end