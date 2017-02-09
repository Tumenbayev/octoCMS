<?php namespace Post\Post\Components;

use Cms\Classes\ComponentBase;

use Post\Post\Models\Post as PostModel;

class Post extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Post Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties()
    {
        return [];
    }

    public function getPosts()
    {
        return PostModel::orderBy('id', 'desc')->get();
    }
    public function getServicePosts()
    {
        $slugs = ['rf---lifting', 'mezoterapiya', 'biorevitalizaciya', 'botulinoterapiya', 'ehlos-procedury', 'konturnaya-plastika', 'chistka-lica', 'fotoomolozhenie'];
        return PostModel::whereIn('slug', $slugs)->where('category','=',1)->orderBy('id', 'asc')->get();
    }
    public function getBeautySpaPosts() {
        return PostModel::where('category', 2)->orderBy('id', 'asc')->take(8)->get();
    }
    public static function getPostBySlug($slug=null) {
        return PostModel::where('slug', $slug)->first();
    }
}
