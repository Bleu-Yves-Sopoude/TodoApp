class Task < ApplicationRecord
    enum status: {pending:'pending',completed:'completed', in_progress:'in_progress'}

    validates :status, presence: true, inclusion:{ in: statuses.keys}
end
