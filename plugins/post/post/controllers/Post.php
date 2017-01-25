<?php namespace Post\Post\Controllers;

use BackendMenu;
use Backend\Classes\Controller;

/**
 * Post Back-end Controller
 */
class Post extends Controller
{
    public $implement = [
        'Backend.Behaviors.FormController',
        'Backend.Behaviors.ListController'
    ];

    public $formConfig = 'config_form.yaml';
    public $listConfig = 'config_list.yaml';

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('Post.Post', 'post', 'post');
        $this->addJs("/themes/multi/assets/js/to_slug.js", "1.0.0");

    }
}
