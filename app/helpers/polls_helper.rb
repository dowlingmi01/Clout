module PollsHelper
  def visualize_votes_for(option)
    content_tag :div, class: 'w-full bg-gray-200 rounded-full h-2.5 dark:bg-gray-700' do
      content_tag :div, class: 'bg-blue-600 h-2.5 rounded-full',
                  style: "width: #{option.question.normalized_votes_for(option)}%" do
        "#{option.votes.count}"
      end
    end
  end
end