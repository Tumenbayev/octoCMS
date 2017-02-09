<?php namespace Team\Team\Components;

use Cms\Classes\ComponentBase;
use Team\Team\Models\Team as TeamModel;

class Team extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Team Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function getTeam()
    {
        return TeamModel::orderBy('id', 'desc')->where('is_published', 1)->take(4)->get();
    }

    public function defineProperties()
    {
        return [];
    }
}
