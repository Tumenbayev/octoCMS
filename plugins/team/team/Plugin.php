<?php namespace Team\Team;

use Backend;
use System\Classes\PluginBase;

/**
 * Team Plugin Information File
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
            'name'        => 'Team',
            'description' => 'No description provided yet...',
            'author'      => 'Team',
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
        return [
            'Team\Team\Components\Team' => 'team'
        ];
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
            'team.team.some_permission' => [
                'tab' => 'Team',
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
            'team' => [
                'label'       => 'Команда',
                'url'         => Backend::url('team/team/team'),
                'icon'        => 'icon-leaf',
                'permissions' => ['team.team.*'],
                'order'       => 500,
            ],
        ];
    }
}
