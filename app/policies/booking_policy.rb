class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # def resolve
    #   scope.all
    # end
  end

  def show?
    record.user == user
  end

  def create?
    record.user == user
  end
end
