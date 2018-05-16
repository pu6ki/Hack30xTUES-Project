module Searchable
  include ActiveSupport::Concern

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    @searchable_fields = []

    def search(q)
      search_by_fields q
    end

    def search_by_fields(q, fields = nil)
      fields ||= searchable_fields
      sql = fields.map { |field| "#{field} LIKE ?" }.join(' OR ')
      parameters = fields.map { "%#{q}%" }
      where(sql, *parameters)
    end

    def searchable_fields(*fields)
      @searchable_fields = fields if fields.present?
      @searchable_fields
    end
  end
end
