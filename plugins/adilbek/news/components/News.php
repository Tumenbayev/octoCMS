<?php namespace Adilbek\News\Components;
use Adilbek\News\Models\News as NewsModel;
use Cms\Classes\ComponentBase;

class News extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'News Component',
            'description' => 'No description provided yet...'
        ];
    }
    public function getNews()
    {
        return NewsModel::orderBy('id', 'desc')->get();
    }
    public function getBigNews(){
        return NewsModel::orderBy('id', 'desc')->first();
    }
    public function defineProperties()
    {
        return [];
    }
}
