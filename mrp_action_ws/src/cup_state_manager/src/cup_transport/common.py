#! /usr/bin/env python
# -*- coding: utf-8 -*-

class Robots:
    """
    Integer IDs for the three participating robots,
    the number is the same as the internship group number.
    """
    CupAcceptor = 1
    CupNavigator = 2
    CupDeliverer = 3


class CupState:
    """
    Global states of the cup transport system.
    """
    Idle = 'idle'
    NavigatingToAcceptor = 'navigating to acceptor'
    Accepting = 'accepting cup'
    NavigatingToDeliverer = 'navigating to deliverer'
    Delivering = 'delivering cup'


class CupDestination:
    """
    Destinations for the cup navigator robot: It can
    navigate to the acceptor and to the deliverer.
    """
    Acceptor = True
    Deliverer = False


class TransportResult:
    """
    Result codes for the global *TransportCup* action.
    If one of the three robots causes the global action
    to fail, the result code of the respective robot
    is used as global result code.
    """
    SUCCESS = 200


class NavigationResult:
    """
    Result codes for the cup navigator robot.
    """
    SUCCESS = 200
    UNKNOWN_ERROR = 600
    # TODO: add more result codes


class CupGraspResult:
    """
    Result codes for the two cup grasping robots (acceptor
    and deliverer).
    """
    SUCCESS = 200
    CUP_NOT_REACHABLE = 301
    PLATFORM_NOT_REACHABLE = 302
    CUP_NOT_FOUND = 401
    PLATFORM_NOT_FOUND = 402
    PLANNING_FAILED = 500
    UNKNOWN_ERROR = 600