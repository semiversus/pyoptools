
cimport numpy as np
np.import_array()

from cpython cimport bool


cdef class Ray:
    cdef np.ndarray cpos
    cdef public object  n, parent, label, draw_color
    cdef public int order  # In surfaces that produce multiple rays, each ray
                          # should be assigned a different order. This is done
                          # in the ray.add_child method

    cdef public list orig_surf  # path of the originating surface
    cdef public double intensity, wavelength, pop
    cdef list __childs
    cdef np.ndarray _dir

    # amount of parents of this ray in the optical path. It counts the number of
    # times  a ray have been propagated through surfaces. It is used to stop
    # the propagation in resonant cavities.

    cdef public int _parent_cnt

    cpdef Ray ch_coord_sys(self, np.ndarray no, np. ndarray ae)
    cpdef Ray ch_coord_sys_inv_f(self, np.ndarray no , np.ndarray ae, bool childs)

    # cpdef Ray ch_coord_sys(self, no, ae)

    # ~ def ch_coord_sys_inv(self,no,ae,childs=False):
    # ~ def ch_coord_sys(self,no,ae):
    # ~ def get_final_rays(self, inc_zeros=True):
    # ~ def copy(self):
    # ~ def reverse(self):
    # ~ def add_child(self, cr):
    # ~ def optical_path_parent(self):
    # ~ def optical_path(self):
cdef Ray Rayf(np.ndarray pos, np.ndarray dir, double intensity, double wavelength,
              n, label, draw_color, parent, double pop, orig_surf, int order, int _parent_cnt)
