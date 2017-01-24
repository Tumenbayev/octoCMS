<?php namespace Post\Post;

use Backend;
use System\Classes\PluginBase;

/**
 * Post Plugin Information File
 */
class Plugin extends PluginBase
{
    /**
     * Returns information about this plugin.
     *
     * @return array
     */
    public function pluginDetails()
    {
        return [
            'name'        => 'Post',
            'description' => 'No description provided yet...',
            'author'      => 'Post',
            'icon'        => 'icon-leaf'
        ];
    }

    /**
     * Register method, called when the plugin is first registered.
     *
     * @return void
     */
    public function register()
    {

    }

    /**
     * Boot method, called right before the request route.
     *
     * @return array
     */
    public function boot()
    {

    }

    /**
     * Registers any front-end components implemented in this plugin.
     *
     * @return array
     */
    public function registerComponents()
    {

        return ['Post\Post\Components\Post' => 'post'];

    }

    /**
     * Registers any back-end permissions used by this plugin.
     *
     * @return array
     */
    public function registerPermissions()
    {
        return []; // Remove this line to activate

        return [
            'post.post.some_permission' => [
                'tab' => 'Post',
                'label' => 'Some permission'
            ],
        ];
    }

    /**
     * Registers back-end navigation items for this plugin.
     *
     * @return array
     */
    public function registerNavigation()
    {
        return [
             'catalog' => [
                 'label'       => 'Список страниц',
                 'url'         => \Backend::url('post/post/post'),
                 'icon'        => 'icon-list-alt',
                 'order'       => 500
             ]
         ];
    }
}
