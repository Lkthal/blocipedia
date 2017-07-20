class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    user == record.user || user.admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.admin?
        wikis = scope.all
      elsif user.premium?
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private == false || wiki.user == user || wiki.collaborators.exists?(user_id: user.id)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          p wiki.collaborators
          if !wiki.private || wiki.collaborators.exists?(user_id: user.id)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end
