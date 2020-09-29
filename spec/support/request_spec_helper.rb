module RequestSpecHelper # rubocop:disable Layout/EndOfLine
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end
end
