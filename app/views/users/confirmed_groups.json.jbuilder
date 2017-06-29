json.confirmed_groups do
    json.array! @groups, partial: 'groups/group', as: :group
end
