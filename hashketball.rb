require 'pry'


def game_hash
  {
    away: 
    { team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: [
        { player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: [
        { player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ] }
  }
end

def players
  game_hash[:away][:players].concat(game_hash[:home][:players])
end

def teams
  game_hash.values 
end

def find_player(name)
  players.find do |player|
    player[:player_name] == name
  end
end


def find_players_of_team(name)
  teams.find do |team|
    team[:team_name] == name
  end[:players]
end


def num_points_scored(name)
  find_player(name)[:points]
end

def sum_points_team(name)
  find_players_of_team(name).reduce(0) do |sum, player|
    sum + player[:points]
  end
end 

def array_player_names
  players.map {|players| players.values[0]}
end

def shoe_size(name)
  find_player(name)[:shoe]
end


def team_colors(team_input)
  teams.find do |team|
    team[:team_name] == team_input
  end[:colors]
end

 

def team_names
  teams.map do |team|
    team[:team_name]
  end
end



def player_numbers(input)
  find_players_of_team(input).map do |player|
    player[:number]
  end
end



def player_stats(input)
  find_player(input).tap { |stats| stats.delete(:player_name) }
end



def big_shoe_rebounds
  players.max_by {|player| player[:shoe]}[:rebounds]
end

def most_points_scored
  players.max_by {|player| player[:points]}[:player_name]
end

def winning_team
  if sum_points_team("Charlotte Hornets") > sum_points_team("Brooklyn Nets")
    "Charlotte Hornets"
  else
    "Brooklyn Nets"
  end
end

def player_with_longest_name
  array_player_names.max_by do |player| 
    player.length
  end 
end

def long_name_steals_a_ton?
  player_with_longest_name == players.max_by {|player| player[:steals]}[:player_name]
end

