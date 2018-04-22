class Event < ApplicationRecord
  belongs_to :user
  belongs_to :project

  PHASE = [
      'Admin',
      'Pre-Design',
      'Schematic Design',
      'Design Development',
      'Construction Documents',
      'Construction Administration'].freeze

  ACTION = [
      'Meeting',
      'Drawing',
      'Site Visit',
      'Project Management',
      'Specifications',
      'Research',
      'Design',
      'Revisions',
      'Other'
    ].freeze

  COLORS = {
          "Pre-Design"=>'rgba(213,127,112,0.6)',
          "Schematic Design"=> "rgba(220,185,103,0.6)",
          "Design Development"=> "rgba(134,175,73,0.6)",
          "Construction Documents"=>"rgba(184,139,172,0.6)",
          "Construction Administration"=>"rgba(129,115,151,0.6)",
          "Admin"=>"rgba(240,225,206,0.6)"
        }
  scope :has_dates, -> {where.not(end: nil, start: nil)}
  scope :billed, -> {where(billed: true)}
  scope :unbilled, -> {where(billed: false)}
  scope :submitted, -> {where(submitted: true)}
  scope :unsubmitted, -> {where(submitted: false)}
  scope :sorted, -> { order(start: "ASC") }


  ## to-do - add validation for start and end; rename end to stop

  attr_accessor :date_range

  def color
    COLORS[phase] ||'rgba(173,163,151,1)'
  end


  def duration
    if !self.end || !self.start
      return 0
    end
  self.end - self.start
  end

  def duration_minutes
    duration/60
  end

  def duration_hours
    duration/3600
  end

  def all_day_event?
    if self.start == present?
      self.start == self.start.midnight && self.end == self.end.midnight ? true : false
    else
      false
    end
  end

  def entry_year
    if !self.end
        return 0
    end
     return self.end.year
  end

  def entry_month
    if !self.end
      return 0
    end
    self.end.month
  end

  def entry_day
    return 0 unless self.end
    self.end.day
  end

  def self.to_CSV(options = {})
    desired_columns = ["id", "start", "end", "title", "duration_hours", "phase", "description"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |event|
        csv << event.attributes.values_at(*desired_columns)
      end
    end
  end
end
